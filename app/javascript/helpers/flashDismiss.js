const flashDismiss = () => {

  const removeAlert = (e) => {
    const alert = e.currentTarget.parentNode;
    alert.parentNode.removeChild(alert);
  };

  const dismissAlerts = document.getElementsByClassName('dismiss');

  for (var dismiss of dismissAlerts) {
    dismiss.onclick = removeAlert;
  }
};

export default flashDismiss;
