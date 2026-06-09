	.syntax unified
	.set sub_8003BE8, 0x08003BE8 + 1
	.section .text.ResetText, "ax", %progbits
@ ResetText @ JP 0x08003BC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetText
	.thumb_func
ResetText:
	push {lr}
	ldr r0, _08003BDC @ =0x02028E58
	ldr r1, _08003BE0 @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl sub_8003BE8
	ldr r1, _08003BE4 @ =0x02028E74
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08003BDC: .4byte 0x02028E58
_08003BE0: .4byte 0x06001000
_08003BE4: .4byte 0x02028E74

