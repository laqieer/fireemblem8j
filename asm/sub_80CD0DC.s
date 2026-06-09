	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CD0DC, "ax", %progbits
@ sub_80CD0DC @ JP 0x080CD0DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD0DC
	.thumb_func
sub_80CD0DC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0
	bl sub_8012E84
	ldr r4, _080CD154 @ =0x02022188
	movs r6, #0
	strh r0, [r4]
	ldrh r3, [r7, #0x2a]
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xa0
	bl sub_8012E84
	strh r0, [r4, #2]
	ldr r2, _080CD158 @ =0x03003020
	ldrh r0, [r4]
	adds r1, r2, #0
	adds r1, #0x2d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r6, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, #7
	bgt _080CD132
	movs r0, #8
_080CD132:
	cmp r1, #0x88
	ble _080CD138
	movs r1, #0x88
_080CD138:
	bl sub_80CC590
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x10
	bne _080CD160
	ldr r0, _080CD15C @ =OpAnimHBlank2
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080CD164
	.align 2, 0
_080CD154: .4byte 0x02022188
_080CD158: .4byte 0x03003020
_080CD15C: .4byte 0x080CC7CD  @ OpAnimHBlank2
_080CD160:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CD164:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

