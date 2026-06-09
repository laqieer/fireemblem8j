	.syntax unified
	.set ResetFaces, 0x08005430 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80BB328, 0x080BB328 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80BB4AC, "ax", %progbits
@ sub_80BB4AC @ JP 0x080BB4AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB4AC
	.thumb_func
sub_80BB4AC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl sub_8001ACC
	bl ResetFaces
	bl sub_80BB328
	bl SetDefaultColorEffects
	movs r1, #0
	strh r1, [r4, #0x2e]
	mov r0, sp
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080BB4E8 @ =0x01000010
	bl sub_80D6370
	ldr r0, _080BB4EC @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	blt _080BB502
	cmp r0, #2
	ble _080BB4F0
	cmp r0, #3
	beq _080BB4FC
	b _080BB502
	.align 2, 0
_080BB4E8: .4byte 0x01000010
_080BB4EC: .4byte 0x0202BCEC
_080BB4F0:
	ldr r0, _080BB4F8 @ =0x08AC09E0
	ldr r0, [r0]
	b _080BB500
	.align 2, 0
_080BB4F8: .4byte 0x08AC09E0
_080BB4FC:
	ldr r0, _080BB510 @ =0x08AC09E0
	ldr r0, [r0, #4]
_080BB500:
	str r0, [r4, #0x30]
_080BB502:
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB510: .4byte 0x08AC09E0

