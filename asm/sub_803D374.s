	.syntax unified
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803D374, "ax", %progbits
@ sub_803D374 @ JP 0x0803D374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D374
	.thumb_func
sub_803D374:
	push {lr}
	ldr r0, _0803D38C @ =sub_803C7A8
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D388
	ldr r0, _0803D390 @ =AiIsUnitNonActive
	bl sub_803D3E0
_0803D388:
	pop {r0}
	bx r0
	.align 2, 0
_0803D38C: .4byte 0x0803C7A9  @ sub_803C7A8
_0803D390: .4byte 0x0803C7D9  @ AiIsUnitNonActive

