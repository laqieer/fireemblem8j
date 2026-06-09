	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805FA24, "ax", %progbits
@ sub_805FA24 @ JP 0x0805FA24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805FA24
	.thumb_func
sub_805FA24:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, _0805FA5C @ =0x086371AC
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r0, _0805FA60 @ =0x08620B18
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805FA64 @ =0x08620680
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	adds r0, r4, #0
	bl sub_8002DE4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA5C: .4byte 0x086371AC
_0805FA60: .4byte 0x08620B18
_0805FA64: .4byte 0x08620680

