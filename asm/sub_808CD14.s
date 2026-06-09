	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_808C828, 0x0808C828 + 1
	.section .text.sub_808CD14, "ax", %progbits
@ sub_808CD14 @ JP 0x0808CD14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CD14
	.thumb_func
sub_808CD14:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808CD40 @ =0x08A73798
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_808C828
	cmp r5, #0
	bne _0808CD44
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	b _0808CD4C
	.align 2, 0
_0808CD40: .4byte 0x08A73798
_0808CD44:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0808CD4C:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0808CD78 @ =0x08A738D0
	movs r1, #0
	bl sub_8002BCC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CD78: .4byte 0x08A738D0

