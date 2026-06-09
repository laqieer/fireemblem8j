	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_804D584, "ax", %progbits
@ sub_804D584 @ JP 0x0804D584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D584
	.thumb_func
sub_804D584:
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804D5CC @ =0x085D8088
	ldr r1, _0804D5D0 @ =0x080DF0EE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804D5D4 @ =0x0203DDD8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D5C4
	bl sub_8000CD8
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, _0804D5D8 @ =0x020228A8
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0xc7
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl sub_8001EE4
_0804D5C4:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D5CC: .4byte 0x085D8088
_0804D5D0: .4byte 0x080DF0EE
_0804D5D4: .4byte 0x0203DDD8
_0804D5D8: .4byte 0x020228A8

