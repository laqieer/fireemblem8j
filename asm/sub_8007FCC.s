	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set sub_8008E54, 0x08008E54 + 1
	.section .text.sub_8007FCC, "ax", %progbits
@ sub_8007FCC @ JP 0x08007FCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007FCC
	.thumb_func
sub_8007FCC:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _08007FEA
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #0x1a
	movs r2, #0
	adds r3, r4, #0
	bl sub_8008E54
	b _08007FF8
_08007FEA:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _08008000 @ =0x44444444
	movs r1, #0x19
	adds r3, r4, #0
	bl sub_8008E54
_08007FF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008000: .4byte 0x44444444

