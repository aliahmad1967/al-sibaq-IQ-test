export default function ProgressBar({ label, value, max }) {
  return (
    <div className="mb-4 text-right">
      <div className="flex justify-between mb-1">
        <span className="text-sm text-gray-300">{label}</span>
        <span className="text-sm text-gray-400">{value}/{max}</span>
      </div>
      <div className="w-full bg-gray-700 rounded-full h-2.5">
        <div
          className="bg-[#5d5fef] h-2.5 rounded-full transition-all duration-500"
          style={{ width: `${(value / max) * 100}%` }}
        ></div>
      </div>
    </div>
  );
}