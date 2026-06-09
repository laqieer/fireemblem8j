	.syntax unified
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.section .text.sub_8006E04, "ax", %progbits
@ sub_8006E04 @ JP 0x08006E04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006E04
	.thumb_func
sub_8006E04:
	push {r4, r5, lr}
	ldr r1, _08006E44 @ =0x085B90D4
	ldr r2, [r1]
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _08006E4C
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08006E3C
	adds r5, r1, #0
_08006E1A:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006E48 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #4
	bl sub_8003D90
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006E1A
_08006E3C:
	ldr r0, _08006E44 @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #4
	b _08006E7E
	.align 2, 0
_08006E44: .4byte 0x085B90D4
_08006E48: .4byte 0x030000C8
_08006E4C:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08006E78
	adds r5, r1, #0
_08006E56:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006E88 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #1
	bl sub_8003D90
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006E56
_08006E78:
	ldr r0, _08006E8C @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #1
_08006E7E:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006E88: .4byte 0x030000C8
_08006E8C: .4byte 0x085B90D4

