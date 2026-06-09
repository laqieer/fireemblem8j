	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A7650, "ax", %progbits
@ sub_80A7650 @ JP 0x080A7650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7650
	.thumb_func
sub_80A7650:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080A766C @ =0x08A95E20
	bl Proc_StartBlocking
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A766C: .4byte 0x08A95E20

