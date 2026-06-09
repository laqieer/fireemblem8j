	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808DB14, "ax", %progbits
@ sub_808DB14 @ JP 0x0808DB14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DB14
	.thumb_func
sub_808DB14:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0808DB2A
	adds r0, r4, #0
	bl sub_8002DE4
	b _0808DB32
_0808DB2A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0808DB32:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0808DB44
	subs r0, r2, #1
	strh r0, [r1]
_0808DB44:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

