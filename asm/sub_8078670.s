	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8077F8C, 0x08077F8C + 1
	.set sub_80780DC, 0x080780DC + 1
	.section .text.sub_8078670, "ax", %progbits
@ sub_8078670 @ JP 0x08078670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078670
	.thumb_func
sub_8078670:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08078688
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080786A8
_08078688:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080786A2
	adds r0, r4, #0
	movs r1, #2
	bl sub_80780DC
	bl sub_8077F8C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_080786A2:
	adds r0, r4, #0
	bl sub_8002DE4
_080786A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

