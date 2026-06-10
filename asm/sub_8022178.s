	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8022178, "ax", %progbits
@ sub_8022178 @ JP 0x08022178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022178
	.thumb_func
sub_8022178:
	push {r4, r5, r6, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r1, _080221D0 @ =0x080DC8E8
	mov r0, sp
	movs r2, #0x50
	bl memcpy
	ldr r1, _080221D4 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	movs r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r3, r4, #0
	adds r1, #0x5e
_08022198:
	movs r6, #0
	ldrsh r0, [r3, r6]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	adds r2, #1
	cmp r2, #0xf
	ble _08022198
	bl sub_8001EE4
	ldrh r0, [r4]
	adds r0, #3
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _080221C8
	adds r0, r5, #0
	bl sub_8002DE4
_080221C8:
	add sp, #0x50
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080221D0: .4byte 0x080DC8E8
_080221D4: .4byte 0x020228A8

