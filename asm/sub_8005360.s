	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_8005360, "ax", %progbits
@ sub_8005360 @ JP 0x08005360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005360
	.thumb_func
sub_8005360:
	push {r4, lr}
	lsls r0, r0, #4
	ldr r1, _0800538C @ =0x0202A588
	adds r4, r0, r1
	cmp r4, #0
	beq _08005386
_0800536C:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08005380
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r3, #6
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #8]
	bl CallARM_PushToSecondaryOAM
_08005380:
	ldr r4, [r4]
	cmp r4, #0
	bne _0800536C
_08005386:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800538C: .4byte 0x0202A588

