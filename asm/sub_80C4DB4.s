	.syntax unified
	.set ClearWorldMapHblankChannelFlags, 0x080C6BA4 + 1
	.set GetWorldMapHblankBuffer, 0x080C6B5C + 1
	.set SetWorldMapHblankDest, 0x080C6B94 + 1
	.set sub_80C4B0C, 0x080C4B0C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C4DB4, "ax", %progbits
@ sub_80C4DB4 @ JP 0x080C4DB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4DB4
	.thumb_func
sub_80C4DB4:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80C4B0C
	movs r5, #0
	str r5, [r4, #0x38]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	ldrb r1, [r3]
	subs r0, r0, r1
	str r0, [r4, #0x40]
	movs r0, #0
	movs r1, #1
	bl GetWorldMapHblankBuffer
	adds r2, r0, #0
	mov r1, sp
	movs r0, #0x10
	strh r0, [r1]
	ldr r4, _080C4E54 @ =0x010000A0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl sub_80D6370
	ldr r1, _080C4E58 @ =0x04000012
	movs r0, #0
	bl SetWorldMapHblankDest
	movs r0, #0
	bl ClearWorldMapHblankChannelFlags
	movs r0, #1
	movs r1, #1
	bl GetWorldMapHblankBuffer
	adds r2, r0, #0
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	adds r1, r2, #0
	adds r2, r4, #0
	bl sub_80D6370
	ldr r1, _080C4E5C @ =0x05000054
	movs r0, #1
	bl SetWorldMapHblankDest
	movs r0, #1
	bl ClearWorldMapHblankChannelFlags
	ldr r2, _080C4E60 @ =0x0201BE30
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4E54: .4byte 0x010000A0
_080C4E58: .4byte 0x04000012
_080C4E5C: .4byte 0x05000054
_080C4E60: .4byte 0x0201BE30

