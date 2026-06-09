	.syntax unified
	.set SetFacePosition, 0x0800651C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80BB3DC, 0x080BB3DC + 1
	.section .text.sub_80BB9D8, "ax", %progbits
@ sub_80BB9D8 @ JP 0x080BB9D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB9D8
	.thumb_func
sub_80BB9D8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0x1e
	ldr r0, _080BBA14 @ =0x08AC0C44
	ldr r1, [r6, #0x34]
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r1, #1
	str r1, [r6, #0x34]
	subs r4, r4, r5
	lsls r1, r4, #3
	adds r1, #0xb0
	ldr r0, _080BBA18 @ =0x000001FF
	ands r1, r0
	movs r0, #0
	movs r2, #0x38
	bl SetFacePosition
	adds r0, r4, #0
	movs r1, #0
	bl sub_80BB3DC
	cmp r5, #0x1e
	bne _080BBA0E
	adds r0, r6, #0
	bl sub_8002DE4
_080BBA0E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA14: .4byte 0x08AC0C44
_080BBA18: .4byte 0x000001FF

