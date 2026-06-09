	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C428C, "ax", %progbits
@ sub_80C428C @ JP 0x080C428C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C428C
	.thumb_func
sub_80C428C:
	push {r4, lr}
	ldr r0, _080C42AC @ =0x08AC1108
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, _080C42B0 @ =0x08AC1EEC
	bl Proc_EndEach
	ldr r0, [r4, #0x30]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C42AC: .4byte 0x08AC1108
_080C42B0: .4byte 0x08AC1EEC

