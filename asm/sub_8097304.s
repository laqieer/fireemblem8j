	.syntax unified
	.set CanPrepScreenSave, 0x080972D4 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set IsDivinationOptionAvailable, 0x080A2C10 + 1
	.set sub_80993F0, 0x080993F0 + 1
	.section .text.sub_8097304, "ax", %progbits
@ sub_8097304 @ JP 0x08097304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097304
	.thumb_func
sub_8097304:
	push {r4, lr}
	bl sub_80993F0
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097328
	ldr r0, _08097324 @ =0x08A93F4C
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _08097366
	.align 2, 0
_08097324: .4byte 0x08A93F4C
_08097328:
	cmp r4, #4
	bne _08097344
	movs r0, #2
	bl IsDivinationOptionAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809735C
	ldr r0, _08097340 @ =0x08A93F4C
	ldr r0, [r0, #0x30]
	b _0809736A
	.align 2, 0
_08097340: .4byte 0x08A93F4C
_08097344:
	cmp r4, #2
	bne _0809735C
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809735C
	ldr r0, _08097358 @ =0x08A93F4C
	ldr r0, [r0, #0x18]
	b _0809736A
	.align 2, 0
_08097358: .4byte 0x08A93F4C
_0809735C:
	ldr r0, _08097370 @ =0x08A93F4C
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
_08097366:
	adds r1, r1, r0
	ldr r0, [r1]
_0809736A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08097370: .4byte 0x08A93F4C

