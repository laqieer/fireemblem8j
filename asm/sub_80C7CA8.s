	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_80C7264, 0x080C7264 + 1
	.section .text.sub_80C7CA8, "ax", %progbits
@ PutWmDotSprite @ JP 0x080C7CA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutWmDotSprite
	.thumb_func
PutWmDotSprite:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_80C7264
	add r0, sp, #4
	ldrh r1, [r0]
	adds r1, #4
	ldrh r0, [r5, #0x2e]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r0, #0
	ldrh r1, [r4]
	adds r1, #4
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r4, r2, #0
	adds r0, r6, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080C7D28
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bhi _080C7D28
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	movs r1, #4
	cmp r0, #0
	beq _080C7D04
	movs r1, #5
_080C7D04:
	ldr r3, _080C7D30 @ =0x08AC26D0
	adds r2, r5, #0
	adds r2, #0x2c
	lsls r0, r1, #0xc
	movs r1, #0xcf
	lsls r1, r1, #1
	orrs r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xb
	adds r1, r6, #0
	adds r2, r4, #0
	bl PutSprite
_080C7D28:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7D30: .4byte 0x08AC26D0

