class Perceptron(object):
  '''Neural Network: Perceptron
  Attributes:
    weight (numpy.ndarray): Calculated weights from the fitting.
    weight_list (numpy.ndarray): Previous calculated weights.
    cost (list): Variation of error in fitting.

  Args:
    epochs (int): Number of epochs.
    rate (float): Learning rate, e.g. eta.
    error_max (float): Maximum acceptable error.
  '''
  def __init__(self, epochs = 100, rate = 0.1, error_max = 0.01):
    self.epochs = epochs
    self.rate = rate
    self.error_max = error_max
  
  def fit(self, X, y):
    '''Train a model with the data input X and the desired output y.
    Args:
        X(numpy.ndarray): Training data (input).
        y(numpy.ndarray): Training data (desired output).
    '''
    self.weight = np.random.uniform(0, 1, X.shape[1] + 1) 
    it, error = 0,0.
    self.cost=[]
    self.weight_list = self.weight
    
    while it<self.epochs:
      error = 0
      for i in range(X.shape[0]):            
        output = self._rectifier(X[i])
        update = self.rate*(y[i]-output)
        
        self.weight[0] += update
        self.weight[1:] += update*X[i]
        
        error += abs(update)
      it += 1
      self.cost.append(error)
      self.weight_list = np.vstack([self.weight_list, self.weight])
      
      if(error<self.error_max):
        break
      
  def _net_input(self, X):  
    return np.dot(X, self.weight[1:]) + self.weight[0]

  def _rectifier(self, X):
    return np.where(self._net_input(X) >= 0.0, 1, -1)
  
  def predict(self, X_test):        
    '''Predict the outcome to a data using a trained model.
    Args:
      X_test: data from which we want to predict the result.
    '''
    return np.where(self._net_input(X_test) >= 0.0, 1, -1)
