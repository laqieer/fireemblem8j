	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_804D344, "ax", %progbits
@ sub_804D344 @ JP 0x0804D344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D344
	.thumb_func
sub_804D344:
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0804D388 @ =0x080DF0C6
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804D38C @ =0x0203DDD8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D37E
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	adds r1, #0x10
	ldr r3, _0804D390 @ =0x020228A8
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, _0804D394 @ =0x00000262
	adds r3, r3, r1
	strh r0, [r3]
	bl sub_8001EE4
_0804D37E:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D388: .4byte 0x080DF0C6
_0804D38C: .4byte 0x0203DDD8
_0804D390: .4byte 0x020228A8
_0804D394: .4byte 0x00000262

