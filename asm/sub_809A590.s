	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set ClearSupplyItems, 0x08031454 + 1
	.section .text.sub_809A590, "ax", %progbits
@ sub_809A590 @ JP 0x0809A590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A590
	.thumb_func
sub_809A590:
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	ldr r0, _0809A5CC @ =0x02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bhs _0809A5C4
	ldr r5, _0809A5D0 @ =0x020122D4
_0809A5A2:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A5B6
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0809A5B6
	bl AddItemToConvoy
_0809A5B6:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0809A5CC @ =0x02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blo _0809A5A2
_0809A5C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A5CC: .4byte 0x02012F54
_0809A5D0: .4byte 0x020122D4

