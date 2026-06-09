	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_808DE68, "ax", %progbits
@ sub_808DE68 @ JP 0x0808DE68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DE68
	.thumb_func
sub_808DE68:
	push {lr}
	ldr r0, _0808DE78 @ =0x08A738D0
	bl Proc_Find
	cmp r0, #0
	bne _0808DE7C
	movs r0, #0
	b _0808DE7E
	.align 2, 0
_0808DE78: .4byte 0x08A738D0
_0808DE7C:
	movs r0, #1
_0808DE7E:
	pop {r1}
	bx r1
	.align 2, 0

