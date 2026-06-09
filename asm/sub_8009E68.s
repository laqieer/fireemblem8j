	.syntax unified
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8009E68, "ax", %progbits
@ sub_8009E68 @ JP 0x08009E68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009E68
	.thumb_func
sub_8009E68:
	push {lr}
	ldr r0, _08009E94 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _08009E98 @ =sub_80152C8
	bl sub_8001208
	ldr r0, _08009E9C @ =0x085B946C
	movs r1, #3
	bl sub_8002BCC
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009E94: .4byte 0x08015319  @ sub_8015318
_08009E98: .4byte 0x080152C9  @ sub_80152C8
_08009E9C: .4byte 0x085B946C

