	.syntax unified
	.section .text.GetSoloAnimPreconfType, "ax", %progbits
@ GetSoloAnimPreconfType @ JP 0x0802C9A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSoloAnimPreconfType
	.thumb_func
GetSoloAnimPreconfType:
	push {lr}
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0802C9BA
	movs r0, #0
	b _0802C9CA
_0802C9BA:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802C9C8
	movs r0, #1
	b _0802C9CA
_0802C9C8:
	movs r0, #3
_0802C9CA:
	pop {r1}
	bx r1
	.align 2, 0

