	.syntax unified
	.set sub_80165F0, 0x080165F0 + 1
	.section .text.sub_8024B04, "ax", %progbits
@ sub_8024B04 @ JP 0x08024B04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024B04
	.thumb_func
sub_8024B04:
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08024B44 @ =0x03004DF0
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08024B48 @ =0x02022CA8
	adds r3, r3, r2
	movs r2, #1
	bl sub_80165F0
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024B44: .4byte 0x03004DF0
_08024B48: .4byte 0x02022CA8

