	.syntax unified
	.set sub_80149B4, 0x080149B4 + 1
	.section .text.sub_8077048, "ax", %progbits
@ sub_8077048 @ JP 0x08077048 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077048
	.thumb_func
sub_8077048:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _080770A4 @ =0x085F24A8
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _08077060
	rsbs r0, r4, #0
_08077060:
	ldr r5, _080770A8 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _080770AC @ =0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_80149B4
	adds r0, r4, #0
	cmp r0, #0
	bge _08077082
	rsbs r0, r0, #0
_08077082:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_80149B4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080770A4: .4byte 0x085F24A8
_080770A8: .4byte 0x000003FF
_080770AC: .4byte 0x06010000

