function convconm(x,h,a,b,vec)
  figure (1) % Se crea una figura para hacer las gráficas
  dtau = 0.005; % Base de los rectangulos para realizar la integral 
  tau = a:dtau:b; % Intervalo de visualización del resultado
  ti = 0; % Indice para el vector de resultados
  tvec = -5:.1:5.75; % traslaciones de t, cuantas integrales se calulan  
  y = NaN*zeros(1, length (tvec)); % Resultados de acuerdo a cuantos t
  for t = tvec, % Cantidad de traslaciones
      ti = ti+1; % Indice para guardar el resultado (indice del tiempo)
      if(vec == 0)
          xh = x(t-tau).*h(tau); % resultado de la multiplicación
      else
          xh = x(t+tau).*h(tau);
      end
      lxh = length(xh); % longitud del resultado
      y(ti) = sum(xh.*dtau); % Base por altura, aproximación de la integral
      
      subplot (2,1,1), % gráfica de 2 x 1 (primera)
      if(vec == 0)
          plot(tau, h(tau), 'r-', tau, x(t-tau), 'g--', t, -3, 'ob'); %graficas
      else
          plot(tau, h(tau), 'r-', tau, x(t+tau), 'c--', -t, -3, 'ob'); %graficas
      end
      axis ([tau(1) tau(end) -2.0 2.5]); % límites de los ejes
      patch([tau(1:end-1); tau(1:end-1); tau(2:end); tau(2:end)],...
      [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
      [.8 .8 .8], 'edgecolor', 'none');
      xlabel('\tau'); % Texto del eje X
      legend('h(\tau)', 'x(t-\tau)','t','h(\tau)x(t-\tau)')% Caja de Texto  
      
      subplot (2, 1, 2)  % gráfica de 2 x 1 (segunda)
      plot (tvec, y, 'k', tvec (ti), y(ti), 'ok');
      xlabel ('t'); 
      ylabel ('y(t) = \int h(\tau)x(t-\tau) d\tau');
      axis ([tau(1) tau(end) -1.0 5.0]); % límites del eje
      grid; % malla
      drawnow; % efecto de movimiento continuo
  end
  end