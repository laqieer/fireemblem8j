	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_808DC14, "ax", %progbits
@ sub_808DC14 @ JP 0x0808DC14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DC14
	.thumb_func
sub_808DC14:
	push {lr}
	ldr r0, _0808DC2C @ =0x08A73798
	bl Proc_Find
	cmp r0, #0
	beq _0808DC30
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808DC30
	movs r0, #0
	b _0808DC32
	.align 2, 0
_0808DC2C: .4byte 0x08A73798
_0808DC30:
	movs r0, #1
_0808DC32:
	pop {r1}
	bx r1
	.align 2, 0

