	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_805C138, "ax", %progbits
@ sub_805C138 @ JP 0x0805C138 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C138
	.thumb_func
sub_805C138:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805C164
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0805C16C @ =0x02022968
	movs r2, #0x20
	bl sub_80D636C
	bl sub_8001EE4
_0805C164:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C16C: .4byte 0x02022968

