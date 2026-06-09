	.syntax unified
	.set sub_80149B4, 0x080149B4 + 1
	.section .text.sub_80770B0, "ax", %progbits
@ sub_80770B0 @ JP 0x080770B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80770B0
	.thumb_func
sub_80770B0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _080770F8 @ =0x08A1D320
	mov sb, r0
	ldr r0, _080770FC @ =0x085F24A8
	mov r8, r0
	cmp r7, #0
	blt _08077108
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _08077100 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08077104 @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_80149B4
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_80149B4
	b _08077138
	.align 2, 0
_080770F8: .4byte 0x08A1D320
_080770FC: .4byte 0x085F24A8
_08077100: .4byte 0x000003FF
_08077104: .4byte 0x06010000
_08077108:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _08077188 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0807718C @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_80149B4
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_80149B4
_08077138:
	adds r0, r7, #0
	cmp r7, #0
	bge _08077140
	rsbs r0, r7, #0
_08077140:
	ldr r4, _08077188 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0807718C @ =0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_80149B4
	adds r0, r7, #0
	cmp r0, #0
	bge _08077162
	rsbs r0, r0, #0
_08077162:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_80149B4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077188: .4byte 0x000003FF
_0807718C: .4byte 0x06010000

