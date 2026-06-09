	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80628E4, "ax", %progbits
@ sub_80628E4 @ JP 0x080628E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80628E4
	.thumb_func
sub_80628E4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806290C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062910 @ =0x08600BCC
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _08062918
	ldr r0, _08062914 @ =0x080E29A4
	b _08062926
	.align 2, 0
_0806290C: .4byte 0x0201774C
_08062910: .4byte 0x08600BCC
_08062914: .4byte 0x080E29A4
_08062918:
	cmp r5, #1
	bne _08062924
	ldr r0, _08062920 @ =0x080E29E6
	b _08062926
	.align 2, 0
_08062920: .4byte 0x080E29E6
_08062924:
	ldr r0, _08062930 @ =0x080E2A18
_08062926:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08062938
	ldr r0, _08062934 @ =0x0869CCAC
	b _08062946
	.align 2, 0
_08062930: .4byte 0x080E2A18
_08062934: .4byte 0x0869CCAC
_08062938:
	cmp r5, #1
	bne _08062944
	ldr r0, _08062940 @ =0x0869EDF8
	b _08062946
	.align 2, 0
_08062940: .4byte 0x0869EDF8
_08062944:
	ldr r0, _08062950 @ =0x0869EBD8
_08062946:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062950: .4byte 0x0869EBD8

