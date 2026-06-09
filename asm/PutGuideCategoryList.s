	.syntax unified
	.set sub_80D2EBC, 0x080D2EBC + 1
	.section .text.PutGuideCategoryList, "ax", %progbits
@ PutGuideCategoryList @ JP 0x080D2F44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutGuideCategoryList
	.thumb_func
PutGuideCategoryList:
	push {r4, r5, r6, lr}
	ldr r0, _080D2F5C @ =0x08BABAF4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2F60
	adds r0, r1, #0
	adds r0, #0x3c
	b _080D2F64
	.align 2, 0
_080D2F5C: .4byte 0x08BABAF4
_080D2F60:
	adds r0, r1, #0
	adds r0, #0x3d
_080D2F64:
	ldrb r6, [r0]
	movs r4, #0
	movs r5, #5
_080D2F6A:
	cmp r4, r6
	bge _080D2F78
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D2EBC
_080D2F78:
	adds r5, #2
	adds r4, #1
	cmp r4, #5
	ble _080D2F6A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

