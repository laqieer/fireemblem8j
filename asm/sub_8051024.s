	.syntax unified
	.set DisableEfxStatusUnits, 0x0805583C + 1
	.set NewEfxHpBarColorChange, 0x080552A8 + 1
	.set sub_8055704, 0x08055704 + 1
	.set sub_8055B64, 0x08055B64 + 1
	.section .text.sub_8051024, "ax", %progbits
@ sub_8051024 @ JP 0x08051024 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051024
	.thumb_func
sub_8051024:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08051068 @ =0x02000000
	ldr r0, [r4]
	bl sub_8055704
	ldr r0, [r4, #8]
	bl sub_8055704
	ldr r1, _0805106C @ =0x0203E1D4
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_8055B64
	ldr r0, _08051070 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08051056
	ldr r0, [r4]
	bl DisableEfxStatusUnits
_08051056:
	ldr r0, [r4]
	bl NewEfxHpBarColorChange
	ldr r0, _08051074 @ =sub_8051078
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051068: .4byte 0x02000000
_0805106C: .4byte 0x0203E1D4
_08051070: .4byte 0x0203A4D0
_08051074: .4byte 0x08051079  @ sub_8051078

