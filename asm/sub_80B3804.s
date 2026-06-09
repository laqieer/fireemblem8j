	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B3804, "ax", %progbits
@ sub_80B3804 @ JP 0x080B3804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3804
	.thumb_func
sub_80B3804:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B3820 @ =0x08A9DDAC
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3820: .4byte 0x08A9DDAC

