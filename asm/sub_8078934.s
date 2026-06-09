	.syntax unified
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8050B00, 0x08050B00 + 1
	.set sub_8051EA0, 0x08051EA0 + 1
	.section .text.sub_8078934, "ax", %progbits
@ sub_8078934 @ JP 0x08078934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078934
	.thumb_func
sub_8078934:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050B00
	bl sub_8051EA0
	ldr r0, _08078958 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _0807895C @ =sub_80152C8
	bl sub_8001208
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078958: .4byte 0x08015319  @ sub_8015318
_0807895C: .4byte 0x080152C9  @ sub_80152C8

