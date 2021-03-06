function batchMIP_Andor(inputdir, outputdir, channels, saveidx, tmax, positions)

    nargin

    meta = MetadataAndor(inputdir);

    if ~exist('positions','var')
        positions = 1:meta.nPositions;
    end

    if ~exist('tmax','var')
        tmax = meta.nTime;
    end
    
    for ci = 1:numel(channels)
        for pi = positions
            disp(['processing position ' num2str(pi) ', channel ' num2str(channels(ci))]);
            makeMIP_Andor(inputdir, pi-1, channels(ci), outputdir, saveidx(ci), tmax);
        end
    end
end