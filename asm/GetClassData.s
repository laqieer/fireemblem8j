	.syntax unified
	.section .text.GetClassData, "ax", %progbits
@ GetClassData @ JP 0x0801911C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetClassData
	.thumb_func
GetClassData:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	ble _08019134
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08019130 @ =0x0885B668
	adds r0, r0, r1
	b _08019136
	.align 2, 0
_08019130: .4byte 0x0885B668
_08019134:
	movs r0, #0
_08019136:
	pop {r1}
	bx r1
	.align 2, 0

