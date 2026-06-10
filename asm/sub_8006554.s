	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8006554, "ax", %progbits
@ sub_8006554 @ JP 0x08006554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006554
	.thumb_func
sub_8006554:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetPortraitData
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _080065A4 @ =0x0202A688
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _080065A8 @ =0x06010000
	adds r1, r1, r2
	bl sub_8013008
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080065A4: .4byte 0x0202A688
_080065A8: .4byte 0x06010000

