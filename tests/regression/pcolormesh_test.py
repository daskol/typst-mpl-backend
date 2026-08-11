import matplotlib.pyplot as plt
import numpy as np
from matplotlib.figure import Figure

from mpl_typst.testing import IssueRegression, flaky


class TestPColorMesh(IssueRegression):

    @staticmethod
    def figure() -> Figure:
        x = np.linspace(-2, 2, 10)
        y = np.linspace(-2, 2, 10)
        X, Y = np.meshgrid(x, y)
        Z = np.sin(X**2 + Y**2)

        fig, ax = plt.subplots(figsize=(13.89, 13.89))
        ax.pcolormesh(X, Y, Z, shading='auto', cmap='viridis')
        ax.axis('off')

        return fig

    @flaky
    def test_reference(self):
        super().test_reference()
