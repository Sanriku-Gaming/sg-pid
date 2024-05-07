$(document).ready(function () {
  $('#player-id-container').draggable({
    axis: 'x',
    containment: 'window',
    stop: savePosition
  });

  function updatePlayerId(serverId) {
    $('#player-id').text(serverId);
  }

  window.addEventListener('message', function (event) {
    if (event.data.action === 'updatePID') {
      updatePlayerId(event.data.id);
    } else if (event.data.action === 'toggleDisplay') {
      toggleDisplay(event.data.show);
    } else if (event.data.action === 'startMove') {
      startMove(event.data.status);
    } else if (event.data.action === 'setPosition') {
      setPosition(event.data.left);
    }
  });

  $(document).keyup(function (e) {
    if (e.key === 'Escape') {
      stopMove();
    }
  });

  function toggleDisplay(show) {
    if (show) {
      $('#player-id-container').fadeIn(500);
    } else {
      $('#player-id-container').fadeOut(500);
    }
    saveDisplayState();
  }

  function startMove(status) {
    if (status) {
      $('#player-id-container').draggable('enable');
    } else {
      stopMove();
    }
  }

  function stopMove() {
    $('#player-id-container').draggable('disable');
    $.post(`https://${GetParentResourceName()}/stopMove`, JSON.stringify({}));
  }

  function setPosition(left) {
    $('#player-id-container').css('left', left + 'px');
    savePosition();
  }

  function saveDisplayState() {
    localStorage.setItem('playerIdDisplayState', $('#player-id-container').is(':visible'));
  }

  function savePosition() {
    var position = $('#player-id-container').position();
    localStorage.setItem('playerIdPosition', JSON.stringify(position));
  }

  loadDisplayState();
  loadPosition();

  function loadDisplayState() {
    var displayState = localStorage.getItem('playerIdDisplayState');
    if (displayState === 'false') {
      $('#player-id-container').hide();
    } else {
      $('#player-id-container').show();
    }
    $.post(`https://${GetParentResourceName()}/setDisplayState`, JSON.stringify({ displayState: displayState === 'true' }));
  }

  function loadPosition() {
    var position = localStorage.getItem('playerIdPosition');
    if (position) {
      position = JSON.parse(position);
      $('#player-id-container').css({
        left: position.left,
        top: position.top
      });
    }
  }
});