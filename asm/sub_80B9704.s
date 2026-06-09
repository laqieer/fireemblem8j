	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B9704, "ax", %progbits
@ sub_80B9704 @ JP 0x080B9704 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9704
	.thumb_func
sub_80B9704:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B972C @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080B9728
	ldr r0, _080B9730 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B9728
	ldr r0, _080B9734 @ =0x08ABC790
	adds r1, r2, #0
	bl Proc_StartBlocking
_080B9728:
	pop {r0}
	bx r0
	.align 2, 0
_080B972C: .4byte 0x0202BCAC
_080B9730: .4byte 0x03005270
_080B9734: .4byte 0x08ABC790

