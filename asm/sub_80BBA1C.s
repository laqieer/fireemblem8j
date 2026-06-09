	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BBA1C, "ax", %progbits
@ sub_80BBA1C @ JP 0x080BBA1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBA1C
	.thumb_func
sub_80BBA1C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080BBA38 @ =0x08AC0C58
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA38: .4byte 0x08AC0C58

