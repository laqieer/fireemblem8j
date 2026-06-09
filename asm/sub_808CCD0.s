	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808CBF4, 0x0808CBF4 + 1
	.section .text.sub_808CCD0, "ax", %progbits
@ sub_808CCD0 @ JP 0x0808CCD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CCD0
	.thumb_func
sub_808CCD0:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_808CBF4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808CCF6
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r0, _0808CCFC @ =0x08A738D0
	bl Proc_EndEach
_0808CCF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CCFC: .4byte 0x08A738D0

