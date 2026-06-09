	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set SetEkrDragonDead, 0x080727A4 + 1
	.set SetEkrDragonSkipTransfer, 0x080727B4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8053E10, 0x08053E10 + 1
	.section .text.sub_8053CDC, "ax", %progbits
@ sub_8053CDC @ JP 0x08053CDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053CDC
	.thumb_func
sub_8053CDC:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetBanimDragonStatusType
	cmp r0, #1
	bne _08053D20
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08053D20
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r4, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	ldr r0, _08053D1C @ =0x0203E14E
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _08053D22
	.align 2, 0
_08053D1C: .4byte 0x0203E14E
_08053D20:
	movs r4, #1
_08053D22:
	ldr r0, _08053D44 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053D6A
	ldr r0, _08053D48 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053D6A
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _08053D4C
	ldr r0, [r5, #0x5c]
	bl SetEkrDragonDead
	b _08053D60
	.align 2, 0
_08053D44: .4byte 0x0201774C
_08053D48: .4byte 0x0201772C
_08053D4C:
	cmp r4, #0
	bne _08053D58
	ldr r0, [r5, #0x5c]
	bl SetEkrDragonSkipTransfer
	b _08053D60
_08053D58:
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl sub_8053E10
_08053D60:
	movs r0, #0x32
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002DE4
_08053D6A:
	pop {r4, r5}
	pop {r0}
	bx r0

