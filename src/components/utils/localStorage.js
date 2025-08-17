export function saveProgress(progress) {
  // Update best score if current score is higher
  const currentBest = loadProgress().bestScore || 0;
  if (progress.playerScore > currentBest) {
    progress.bestScore = progress.playerScore;
  }
  localStorage.setItem("iq_test_progress", JSON.stringify(progress));
}

export function loadProgress() {
  const saved = localStorage.getItem("iq_test_progress");
  return saved ? JSON.parse(saved) : {
    playerScore: 0,
    accuracy: 0,
    completed: false,
    completedAt: null,
    bestScore: 0
  };
}

export function resetProgress() {
  localStorage.removeItem("iq_test_progress");
}
