	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CC904, "ax", %progbits
@ sub_80CC904 @ JP 0x080CC904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC904
	.thumb_func
sub_80CC904:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xf0
	bl sub_8012E84
	ldr r4, _080CC97C @ =0x02022188
	movs r6, #0
	strh r0, [r4]
	ldrh r3, [r7, #0x2a]
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xa0
	bl sub_8012E84
	strh r0, [r4, #2]
	ldr r2, _080CC980 @ =0x03003020
	adds r0, r2, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	ldrh r1, [r4]
	subs r0, #5
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, #0xe8
	ble _080CC958
	movs r0, #0xe8
_080CC958:
	cmp r1, #0x88
	ble _080CC95E
	movs r1, #0x88
_080CC95E:
	bl sub_80CC590
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x10
	bne _080CC988
	ldr r0, _080CC984 @ =OpAnimHBlank2
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080CC98C
	.align 2, 0
_080CC97C: .4byte 0x02022188
_080CC980: .4byte 0x03003020
_080CC984: .4byte 0x080CC7CD  @ OpAnimHBlank2
_080CC988:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CC98C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

