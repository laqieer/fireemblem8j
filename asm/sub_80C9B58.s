	.syntax unified
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80C996C, 0x080C996C + 1
	.section .text.sub_80C9B58, "ax", %progbits
@ sub_80C9B58 @ JP 0x080C9B58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9B58
	.thumb_func
sub_80C9B58:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C9B8C
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl _DivArm1
	adds r3, r0, #0
	ldr r0, _080C9B84 @ =0x08B3B72C
	ldr r1, _080C9B88 @ =0x02022908
	movs r2, #0x10
	bl sub_80C996C
	b _080C9BB8
	.align 2, 0
_080C9B84: .4byte 0x08B3B72C
_080C9B88: .4byte 0x02022908
_080C9B8C:
	ldr r0, _080C9BC8 @ =0x08B3B72C
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r2, _080C9BCC @ =0x081F6C94
	adds r0, r4, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	movs r0, #0
	strh r0, [r4, #0x2c]
_080C9BB8:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_80C96D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9BC8: .4byte 0x08B3B72C
_080C9BCC: .4byte 0x081F6C94

