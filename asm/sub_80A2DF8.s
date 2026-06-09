	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80A2DF8, "ax", %progbits
@ sub_80A2DF8 @ JP 0x080A2DF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2DF8
	.thumb_func
sub_80A2DF8:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080A2E3E
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080A2E1A
	adds r0, #3
_080A2E1A:
	asrs r4, r0, #2
	lsls r0, r4, #5
	ldr r1, _080A2E44 @ =0x08A9A4E4
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _080A2E48 @ =0x02022AA8
	adds r1, r1, r2
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	cmp r4, #5
	bne _080A2E3E
	adds r0, r5, #0
	bl sub_8002DE4
_080A2E3E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E44: .4byte 0x08A9A4E4
_080A2E48: .4byte 0x02022AA8

