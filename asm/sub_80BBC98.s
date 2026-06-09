	.syntax unified
	.set SetFacePosition, 0x0800651C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80BB3DC, 0x080BB3DC + 1
	.section .text.sub_80BBC98, "ax", %progbits
@ sub_80BBC98 @ JP 0x080BBC98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBC98
	.thumb_func
sub_80BBC98:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x1e
	ldr r0, _080BBCF0 @ =0x08AC0C44
	ldr r1, [r7, #0x34]
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #1
	str r1, [r7, #0x34]
	subs r5, r5, r0
	lsls r4, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	ldr r6, _080BBCF4 @ =0x000001FF
	ands r1, r6
	movs r0, #0
	movs r2, #0x30
	bl SetFacePosition
	adds r4, #0xb0
	ands r4, r6
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x30
	bl SetFacePosition
	adds r0, r5, #0
	movs r1, #0
	bl sub_80BB3DC
	mov r0, r8
	cmp r0, #0x1e
	bne _080BBCE6
	adds r0, r7, #0
	bl sub_8002DE4
_080BBCE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBCF0: .4byte 0x08AC0C44
_080BBCF4: .4byte 0x000001FF

