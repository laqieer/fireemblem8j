	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_808C6D4, "ax", %progbits
@ sub_808C6D4 @ JP 0x0808C6D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C6D4
	.thumb_func
sub_808C6D4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0808C70E
	movs r0, #0
	strh r0, [r5, #0x3c]
_0808C70E:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _0808C71E
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_0808C71E:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble _0808C734
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
_0808C734:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

