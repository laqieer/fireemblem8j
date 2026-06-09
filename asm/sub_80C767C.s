	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set sub_80C7498, 0x080C7498 + 1
	.section .text.sub_80C767C, "ax", %progbits
@ sub_80C767C @ JP 0x080C767C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C767C
	.thumb_func
sub_80C767C:
	push {lr}
	ldr r0, _080C7690 @ =0x08AC2608
	bl CountProcs
	cmp r0, #1
	bne _080C768C
	bl sub_80C7498
_080C768C:
	pop {r0}
	bx r0
	.align 2, 0
_080C7690: .4byte 0x08AC2608

