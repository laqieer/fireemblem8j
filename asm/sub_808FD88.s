	.syntax unified
	.set UpdateMenuButtonPos, 0x0808FB88 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808FC0C, 0x0808FC0C + 1
	.section .text.sub_808FD88, "ax", %progbits
@ sub_808FD88 @ JP 0x0808FD88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FD88
	.thumb_func
sub_808FD88:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808FC0C
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _0808FDC4
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8002DE4
_0808FDC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

